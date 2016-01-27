${SegmentFile}

${SegmentPreExecPrimary}
	ReadINIStr $0 "$EXEDIR\App\Audacity\Portable Settings\audacity.cfg" "Directories" "TempDir"
	${WordReplace} $0 "\\" "?" "+" $1
	${WordReplace} $1 "?" "\" "+" $1
	${GetRoot} $1 $2
	${GetRoot} $EXEDIR $3

	${IfNot} ${FileExists} "$1\*.*"
	${OrIf} $1 == ""
	${OrIf}  $2 != $3
		ReadINIStr $0 "$EXEDIR\Data\settings\AudacityPortableSettings.ini" "AudacityInternalPaths" "TempDir"
		WriteINIStr "$EXEDIR\App\Audacity\Portable Settings\audacity.cfg" "Directories" "TempDir" $0
	${EndIf}
!macroend