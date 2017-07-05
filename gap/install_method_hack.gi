MakeReadWriteGlobal( "InstallMethod" );

BindGlobal( "Old_InstallMethod", InstallMethod );

InstallMethod := function( arg... )
  local current_name, current_oper, current_func, current_func_name;
    
    ## Call first to check errors in input
    CallFuncList( Old_InstallMethod, arg );
    
    current_oper := arg[ 1 ];
    current_func := arg[ Length( arg ) ];
    
    current_name := NameFunction( current_oper );
    current_func_name := NameFunction( current_func );
    if current_func_name = "unknown" then
        SetNameFunction( current_func, current_name );
    fi;
    
end;

MakeReadOnlyGlobal( "InstallMethod" );
