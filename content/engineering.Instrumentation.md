---
id: rvppzwfgnraf86g4e6ucgs6
title: Instrumentation
desc: ""
updated: 2024-12-15T22:35
created: 1648843900650
---

One re-writes 


https://docs.microsoft.com/en-us/dotnet/framework/debug-trace-profile/tracing-and-instrumenting-applications


From [StackOverflow](https://stackoverflow.com/questions/2434516/what-is-instrumentation)


* DLL rewriting. This is what tools like Purify and Quantify do. A previous reply to this question said that they instrument post-compile/link. That is not correct. Purify and Quantify instrument the DLL the first time it is executed after a compile/link cycle, then cache the result so that it can be used more quickly next time around. For large applications, profiling the DLLs can be very time consuming. It is also problematic - at a company I worked at between 1998-2000 we had a large 2 million line app that would take 4 hours to instrument, and 2 of the DLLs would randomly crash during instrumentation and if either failed you would have do delete both of them, then start over.

* In place instrumentation. This is similar to DLL rewriting, except that the DLL is not modified and the image on the disk remains untouched. The DLL functions are hooked appropriately to the task required when the DLL is first loaded (either during startup or after a call to LoadLibrary(Ex). You can see techniques similar to this in the Microsoft Detours library.

* On-the-fly instrumentation. Similar to in-place but only actually instruments a method the first time the method is executed. This is more complex than in-place and delays the instrumentation penalty until the first time the method is encountered. Depending on what you are doing, that could be a good thing or a bad thing.

Intermediate language instrumentation. This is what is often done with Java and .Net languages (C~, VB.Net, F#, etc). The language is compiled to an intermediate language which is then executed by a virtual machine. The virtual machine provides an interface (JVMTI for Java, ICorProfiler(2) for .Net) which allows you to monitor what the virtual machine is doing. Some of these options allow you to modify the intermediate language just before it gets compiled to executable instructions.

Intermediate language instrumentation via reflection. Java and .Net both provide reflection APIs that allow the discovery of metadata about methods. Using this data you can create new methods on the fly and instrument existing methods just as with the previously mentioned Intermediate language instrumentation.

Compile time instrumentation. This technique is used at compile time to insert appropriate instructions into the application during compilation. Not often used, a profiling feature of Visual Studio provides this feature. Requires a full rebuild and link.

Source code instrumentation. This technique is used to modify source code to insert appropriate code (usually conditionally compiled so you can turn it off).

Link time instrumentation. This technique is only really useful for replacing the default memory allocators with tracing allocators. An early example of this was the Sentinel memory leak detector on Solaris/HP in the early 1990s.

The various in-place and on-the-fly instrumentation methods are fraught with danger as it is very hard to stop all threads safely and modify the code without running the risk of requiring an API call that may want to access a lock which is held by a thread you've just paused - you don't want to do that, you'll get a deadlock. You also have to check if any of the other threads are executing that method, because if they are you can't modify it.

The virtual machine based instrumentation methods are much easier to use as the virtual machine guarantees that you can safely modify the code at that point.

(EDIT - this item added later) IAT hooking instrumentation. This involved modifying the import addess table for functions linked against in other DLLs/Shared Libraries. This type of instrumentation is probably the simplest method to get working, you do not need to know how to disassemble and modify existing binaries, or do the same with virtual machine opcodes. You just patch the import table with your own function address and call the real function from your hook. Used in many commercial and open source tools.


