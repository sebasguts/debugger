#
# debugger: Debugging support for GAP
#
# Declarations
#

#! @Arguments file, line [ , function]
#! @Description
#!   Adds a breakpoint to all loaded files whose name
#!   ends <A>file</A>, at line <A>line</A>.
#!   Optionally a <A>function</A> to call can be passed
#!   in, or by default the break loop will be entered.
DeclareGlobalFunction( "AddBreakpoint" );

#! @Arguments file, line
#! @Description
#!   Remove a breakpoints in loaded files whose name
#!   ends <A>file</A>, at line <A>line</A>.
DeclareGlobalFunction( "ClearBreakpoint" );

#! @Arguments
#! @Description
#!   Remove all breakpoints
DeclareGlobalFunction( "ClearAllBreakpoints" );

#! @Arguments
#! @Description
#!   List all breakpoints. Returned as a list of
#!   triples, consisting of file, line, and the function
#!   called.
DeclareGlobalFunction( "ListBreakpoints" );

#! @Arguments [function]
#! @Description
#!   Triggers <A>function</A> next time a new line of code
#!   begins execution. by default, <A>function</A> will enter the
#!   break loop.
#! 
#!   Breaking on the next line is disabled by passing <B>fail</B>.
#!
#!   <A>function</A>, if defined, should accept no arguments.
DeclareGlobalFunction( "BreakNextLine" );

#! @Arguments [function]
#! @Description
#!   Triggers <A>function</A> every time a new line of code
#!   begin execution. by default, <A>function</A> will enter the
#!   break loop. 
#! 
#!   Breaking on every line is disabled by passing <B>fail</B>.
#!
#!   <A>function</A>, if defined, should accept two arguments. These
#!   are the fileid and line number. The fileid is an index into
#!   the array of files returned by <F>GET_FILENAME_CACHE()</F>.
DeclareGlobalFunction( "BreakEveryLine" );

#! @Arguments [func]
#! @Description
#!   Calls <A>func</A> before the next time execution of a function begins.
#!   By default, <A>func</A> will enter the break loop.
#!
#!   Breaking on entry to the next function is disabled by passing <B>fail</B>.
#!
#!   <A>func</A>, if defined, should accept one argument, which
#!   will be the function being called.
DeclareGlobalFunction( "BreakNextEnterFunction" );

#! @Arguments [func]
#! @Description
#!   Calls <A>func</A> before the execution of any function begins.
#!   By default, <A>func</A> will enter the break loop.
#!
#!   Breaking on entry to functions is disabled by passing <B>fail</B>.
#!
#!   <A>func</A>, if defined, should accept one argument, which
#!   will be the function being called.
DeclareGlobalFunction( "BreakEveryEnterFunction" );

#! @Arguments [func]
#! @Description
#!   Calls <A>func</A> before the next time execution of a function ends.
#!   By default, <A>func</A> will enter the break loop.
#!
#!   Breaking on exit of the next function is disabled by passing <B>fail</B>.
#!
#!   <A>func</A>, if defined, should accept one argument, which
#!   will be the function which is returning.
DeclareGlobalFunction( "BreakNextLeaveFunction" );

#! @Arguments [func]
#! @Description
#!   Calls <A>func</A> before the execution of any function ends.
#!   By default, <A>func</A> will enter the break loop.
#!
#!   Breaking on exit of functions is disabled by passing <B>fail</B>.
#!
#!   <A>func</A>, if defined, should accept one argument, which
#!   will be the function which is returning.
DeclareGlobalFunction( "BreakEveryLeaveFunction" );

#! @Arguments func,arg_list
#! @Description
#!  Calls <A>func</A> with arguments <A>arg_list</A> and displays
#!  a list of functions called and exited in the order of calls and exits.
#!
#!  The function does not return anything. Furthermore, functions without
#!  names are skipped.
DeclareGlobalFunction( "TraceFunctionCalls" );
