---
id: 406gztrtgtqtjoabg1xjoba
title: Multiple submodules
desc: ""
updated: 2024-12-15T22:35
created: 1641834743300
---
[Website](https://pytorch.org/)

## DataLoader

It's a iterator helper that would deal w/

# Neural Nets, Forward and Backwards

 To create a neural net, make a class that inherits from `nn.Module`.
 It needs to implement `__init__` and `forward` methods.

```{python}
class DenseNet(nn.Module):
   def __init__():
       self.input = nn.Flatten()
       self.linear_relu_stack=nn.Sequential(
           nn.Linear(28*25, 256),
           nn.ReLU(),
           nn.Linear(256, 128),
           nn.ReLU(),
           nn.Linear(128, 10)
       )
   def forward(self,x):
       x = self.input(x)
       logits = self.linear_relu_stack(x)
       return logits

model = DenseNet().to(device)# send the model to execute on the gpu/cpu


```

 So that's how we encode a a given computational tree.
 Probably there are various simplifications/specializations of the above. Is

## Parameter fitting/optimization and backward pass

After we have defined the 'evaluation' part, next we want to see how to fit parameters to the data.

Define 'optimizer' object and the loss funciton object
**NB** #NB optimizer needs to be supplied the model.parameters() as an argument in order to know what it's optimizing.

If you think about a function instead, the optimizer
would need to know the function + it's parameters, so it makes sense.

```{python}
loss_fn = nn.CrossEntropyLoss()
!!!
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)
```

# Training loop

We have to define the training loop by ourselves.

The backpropagation is done via the following opaque at first look pattern:

```{python}
optimizer.zero_grad() # nullify previous gradient data
loss.backward() #compute gradient (!!!)
optimizer.step() #make step w/ the optimizer
```

Overall  Ifind the above pattern confusing, as there is quite a bit of state manipulation there. 
In particular, the signatures of functions there don't tell you about what's happening.

 Nevertheless, it's short and only 'strange' part is

`loss.backward()`. Why is this actinf on the model parameters? no idea.

from [here](http://seba1511.net/tutorials/beginner/blitz/neural_networks_tutorial.html#:~:text=Loss%20Function,-A%20loss%20function&text=MSELoss%20which%20computes%20the%20mean,the%20input%20and%20the%20target.&text=So%2C%20when%20we%20call%20loss,Variable%20accumulated%20with%20the%20gradient.)

**So, when we call loss.backward(), the whole graph is differentiated w.r.t. the loss, and all Variables in the graph will have their .grad Variable accumulated with the gradient.**

 Ok, so that makes sense. Every Variable has a .grad Variable, which is acted upon by `loss.backward()`.

```

def train(dataloader, model, loss_fn, optimizer):
    size = len(dataloader.dataset)
    # I guess this tells the model that
    # paramteres are free to update
    
    model.train()
    # for each batch of samples
    for batch, (X, y) in enumerate(dataloader):
        X, y = X.to(device), y.to(device)
        pred = model(X)
        loss = loss_fn(pred, y)

        # Backpropagation and parameter update
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        # Occasional progress report (like callback)
        if batch % 100 == 0:
            loss, current = loss.item(), batch * len(X)
            print(f"loss: {loss:>7f}  [{current:>5d}/{size:>5d}]")

```

## [What Does model.train() do?](https://stackoverflow.com/questions/51433378/what-does-model-train-do-in-pytorch)

It sets the model so layers that behave differently during train and test set.

`model.train()` and `model.eval()` basically only care about dropout and batch normalization layers atm.

```{python}
data = [[1, 2],[3, 4]]
x_data = torch.tensor(data)
```

# [loss.backward()](https://discuss.pytorch.org/t/what-does-the-backward-function-do/9944)

```
loss.backward() computes dloss/dx for every parameter x which has requires_grad=True. These are accumulated into x.grad for every parameter x. In pseudo-code:
```

![](https://discuss.pytorch.org/t/what-does-the-backward-function-do/9944/2)

```{python}
x.grad += dloss/dx

```

So because of that we have to 0 the grad beforehand

# Grad Mode

(Enable grad)[https://pytorch.org/docs/stable/_modules/torch/autograd/grad_mode.html# enable_grad]

## Torch.no_grad

Context manager, disabling (thread-wise) grad calculations. Use when evaluating model.

## a.item()

if object is number/1 element tensor.
use a.tolist() otherwise.

# Differentiable

Some ops in torch are differentiable, some are not.

# Tensors and differeentiataion

['Autograd' is some engine,running in the background? Idk](https://pytorch.org/tutorials/beginner/blitz/autograd_tutorial.html)

# resources

[Pytorch Internals Blog Post](http://blog.ezyang.com/2019/05/pytorch-internals/)

