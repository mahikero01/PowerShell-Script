	param(
			$root = "D:\",
			$FileType = @("eg2", "3gp", "aac", "act", "aiff", "amr", "asf", "au", "avi", "awb", "dct", "drc", "dss", "dvf", "flac", "flv", "gsm", "iklax", "ivs", "m2v", "m4a", "m4p", "m4v", "mkv", "mmf", "mng", "mov", "mp2", "mp3", "mp4", "mpc", "mpg", "mpeg", "mpe", "mpv", "msv", "mxf",  "nsv", "oga", "ogg", "ogv", "opus", "qt", "ra", "raw", "rm", "rmvb", "roq", "svi", "tta", "vox", "wav", "webm", "wv", "wma", "wmv"),
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


