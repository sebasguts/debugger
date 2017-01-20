InstallGlobalFunction( "AddBreakpoint",
function(fileend, line, infunc...)
	local func, i, hitfiles, filelist;
	filelist := GET_FILENAME_CACHE();
	hitfiles := [];
	for i in [1..Length(filelist)] do
		if EndsWith(filelist[i], fileend) then
			Add(hitfiles, i);
		fi;
	od;

	if not IsString(fileend) then
		ErrorNoReturn("First argument must be a string");
	fi;
	
	if not IsInt(line) then
		ErrorNoReturn("Second argument must be an int");
	fi;

	if Length(infunc) = 0 then
		func := Error("Breakpoint Reached!");
	else
		if Length(infunc) = 1 and IsFunction(infunc[1]) then
			func := infunc[1];
		else
			ErrorNoReturn("Usage: filename, line [, func])");
		fi;
	fi;

	if Length(hitfiles) = 0 then
		ErrorNoReturn("Filename not found");
	fi;

	for i in hitfiles do
		Print("Adding breakpoint to ", filelist[i], ":", line,"\n");
		ADD_BREAKPOINT(i, line, func);
	od;

	if Length(GET_BREAKPOINTS()) > 0 then
		ACTIVATE_DEBUGGING();
	fi;
end);

InstallGlobalFunction( "ClearBreakpoint",
function(fileend, line)
	local func, i, hitfiles, filelist;
	filelist := GET_FILENAME_CACHE();
	hitfiles := [];
	for i in [1..Length(filelist)] do
		if EndsWith(filelist[i], fileend) then
			Add(hitfiles, i);
		fi;
	od;

	if Length(hitfiles) = 0 then
		ErrorNoReturn("Filename not found");
	fi;

	for i in hitfiles do
		if CLEAR_BREAKPOINT(i, line, func) then
			Print("Removing breakpoint from ", filelist[i], ":", line);
		fi;
	od;

	if Length(GET_BREAKPOINTS()) then
		DEACTIVATE_DEBUGGING();
	fi;
end);

InstallGlobalFunction( "ClearAllBreakpoints",
	function()
		CLEAR_ALL_BREAKPOINTS();
		DEACTIVATE_DEBUGGING();
end);


InstallGlobalFunction( "ListBreakpoints",
	GET_BREAKPOINTS);