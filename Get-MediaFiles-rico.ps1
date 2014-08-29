	param(
			$root = "D:\",
			$FileType = @("mp3", "aac", "wma", "wmv", "avi", "mkv", "3gp","act", "aiff", "amr", "au", "awb", "dct", "dss" , "dvf", "flac", "gsm", "iklax", "ivs", "m4a", "m4p" ,"mmf", "mpc", "msv", "ogg", "oga", "opus", "ra", "rm", "raw", "tta", "vox", "wav" ,"wv", "webm", "flv", "ogv", "ogg", "drc", "mng", "mov", "qt", "rm", "rmvb", "asf", "mp4", "m4p", "m4v", "mpg", "mp2", "mpeg", "mpg", "mpe", "mpv", "mpg", "mpeg", "m2v" , "m4v", "svi", "3gp", "eg2" , "mxf", "roq", "nsv"),
			$Outfile = "D:\mediafiles.txt"
	     )
	$output = @()
	clear
	$i = 0 
	ForEach($type in $FileType){
		Write-Progress -Activity "Collecting files"  -status "checking for $type files" -percentComplete($i++/$FileType.count*100)
		$files = Get-ChildItem $root -Filter *.$type -Recurse -ErrorAction SilentlyContinue 
		$output += "$type ---> $($files.Count) files"
		$j = 1
		foreach ($file in $files){
			if($files.count -ge 1){
			Write-Progress -Activity "Collecting files" -status "checking $type file nr: $j" -percentComplete ($j++ / $files.count*100)
			}
			
			if($file.FullName -notmatch "seagull|STA|CBT"){
			$output += $file.FullName
			}
		}
	}
	
	$output | set-content $Outfile


