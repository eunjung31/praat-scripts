### This script creates Textgrid(silences) on multiple files ###

form make TextGrids
	sentence source_directory D:
	sentence file_extension .wav
endform

strings = Create Strings as directory list: "directory", source_directory$
number_of_directory = Get number of strings

for idirectory to number_of_directory
	selectObject: strings
	dir_name$ = Get string: idirectory
	Create Strings as file list... list 'source_directory$'/'dir_name$'/#9/*'file_extension$'
	string_ID = selected("Strings")
	number_of_files = Get number of strings
	for ifile to number_of_files
		select Strings list
		file_name$ = Get string... ifile
		file_name_new$ = file_name$ - "wav" + "TextGrid"
		sound = Read from file... 'source_directory$'/'dir_name$'/#9/'file_name$'
		textgrid = To TextGrid (silences): 100, 0, -25, 0.1, 0.1, "silent", "sounding"
		Save as text file: "'source_directory$'/'dir_name$'/#9/'file_name_new$'"
		removeObject: sound
		removeObject: textgrid		
	endfor
endfor
select all
Remove
