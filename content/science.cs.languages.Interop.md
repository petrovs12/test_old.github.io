---
id: 3wq71rfelbnddk3zk4is04w
title: Thrift
desc: ""
updated: 2024-12-15T22:35
created: 1676281032103
---
Can use it to say define a service:

```
exception CustomException {
  1: string message;
}

struct AddResult {
  1: i32 sum;
}

service Calculator {
  AddResult add(1:i32 a, 2:i32 b) throws (1:CustomException ex);
}

```

then generate fome python sclenecton:

```
thrift --getn py cancleator.thrift
```

Then the python snippet willbe like so:

```python
import calculator.Calculator as Calculator

class CalculatorHandler:
    def add(self, a, b):
        if a < 0 or b < 0:
            raise Calculator.CustomException("Both numbers must be non-negative")
        else:
            return Calculator.AddResult(sum=a+b)

handler = CalculatorHandler()
processor = Calculator.Processor(handler)
transport = TSocket.TServerSocket(port=9090)
server = TServer.TSimpleServer(processor, transport)
server.serve()

```

And the clinent as so:

```cpp
#include <iostream>
#include <thrift/transport/TBufferTransports.h>
#include <thrift/protocol/TBinaryProtocol.h>
#include "Calculator.h"

using namespace apache::thrift;
using namespace apache::thrift::protocol;
using namespace apache::thrift::transport;
using namespace ::calculator;

int main() {
    std::shared_ptr<TTransport> socket(new TSocket("localhost", 9090));
    std::shared_ptr<TTransport> transport(new TBufferedTransport(socket));
    std::shared_ptr<TProtocol> protocol(new TBinaryProtocol(transport));
    CalculatorClient client(protocol);

    try {
        AddResult result = client.add(3, 4);
        std::cout << "3 + 4 = " << result.sum << std::endl;

        client.add(-1, 2);
    } catch (CustomException& ex) {
        std::cout << "Caught custom exception: " << ex.message << std::endl;
    }

    transport->close();
    return 0;
}

```

Note the port above in the cpp code.
Evene if this doesn't work great, iit should be representing the relationships between the components well enough.

