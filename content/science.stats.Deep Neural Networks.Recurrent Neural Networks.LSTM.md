---
id: i3u8x1kt4op92mcv9t0ltdv
title: GRU Simplification
desc: ""
updated: 2024-12-15T22:35
created: 1646175556796
---
The LSTM has 2 'internal' states:
$h$ and $c$.
Overall, we operate with the following variables at each timepoint

$x_t$ - input
$h_t$: hidden state
$c_t$: cell state- another state
$f_t$ - 'forget' gate
$i_t$ - 'input' gate
$g_t$ - update gate
$o_t$ - output

As well as dedicated matrices for everything:
$f_i = sigmoid(W_{x,f}x_i+W_{h,f}h_{i-1})$

$i_i = sigmoid(W_{x,i}x_i+W_{h,i}h_{i-1})$

$g_i = tanh(W_{x,g}x_i+W_{h,i}h_{i-1})$

$c_t=f_t\cdot c_{t-1}+i_t\cdot g_t$

$o_i = tanh(W_{x,o}x_i+W_{o,i}h_{i-1})$

$h_t=o_t\cdot tanh(c_t)$

The basic idea here is that we put a bunch of multiplications around

There's a simpler way to achieve the above:
#TODO 

