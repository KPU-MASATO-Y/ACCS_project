//Store the image data which you want to measure in the “test folder”

//Display the warning message.
showMessage("Attention of usage", 
"This program is opened in the hope that it will be useful, but without any warranty.");
showMessage("Attention of usage", 
"This program occupies the CPU and memory of the computer.");

//Require consent for use. If you agree, select “test folder” and “preparation folder”.
ans = getString("Do you agree to the attention of usage. Yes or No ?", "Yes");
if (ans == "Yes") {
	 showMessage("Message", "Please select 'preparation' folder");
	 ddir= getDirectory("Choose a Directory");
	 showMessage("Message", "Please select 'test' folder");
	 t= getDirectory("Choose a Directory");
}else if (ans == "yes") {
	 showMessage("Message", "Please select 'preparation' folder");
	 ddir= getDirectory("Choose a Directory");
	 showMessage("message", "Please select 'test' folder");
	 t= getDirectory("Choose a Directory");
}else if (ans =="YES") {
	 showMessage("Message", "Please select 'preparation' folder");
	 ddir= getDirectory("Choose a Directory");
	 showMessage("Message", "Please select 'test' folder");
	 t= getDirectory("Choose a Directory");
}else {
	a = "do not run this program.";
	return a;
}

//Select “unsharp mask folder”. The output data in this folder would be processed “unsharp mask”.
showMessage("Message", "Please select 'unsharp mask' folder");
tir= getDirectory("Choose a Directory");

files= getFileList(t);

for(i=0; i < files.length; i++){

	f=t + files[i];
	
	doUnsharpMask(f);
}

function doUnsharpMask(f){
	
	if(!File.isDirectory(f)){
	
		
		open(f);
		run("Unsharp Mask...", "radius=2 mask=0.5");
		newpath= tir + File.nameWithoutExtension + " " + "unsharp";
		saveAs(".tif", newpath );
		close();
		
		}
}

//Start TWS.
Imagedir = ddir + "images to run TWS.tif";
run("Trainable Weka Segmentation", "open=[Imagedir]");

//Select “unsharp mask folder”. Select “segmentation folder”. Select “output folder”.
showMessage("First message", "Please select 'unsharp mask' folder");
d= getDirectory("Choose a Directory");
showMessage("Second message", "Please select 'segmentation' folder");
dir= getDirectory("Choose a Directory");
showMessage("Third message", "Please select 'output' folder");
dir1= getDirectory("Choose a Directory");



//Acquisition of machine learning data.
classifierdir = ddir + "classifier.model";
call("trainableSegmentation.Weka_Segmentation.loadClassifier", classifierdir);

//Acquisition of active window.
ActiveWindow= getTitle();

//Start counting.
files= getFileList(d);

for(i=0; i < files.length; i++){

	f=d + files[i];
	
	doCounting(f);
}

function doCounting(f){
	
	if(!File.isDirectory(f)){
	
		selectWindow(ActiveWindow);
		call("trainableSegmentation.Weka_Segmentation.applyClassifier", d, files[i], 
		"showResults=true", "storeResults=false", "probabilityMaps=false", "");
		selectWindow("Classification result");
		path= dir + File.nameWithoutExtension + " " + "Num" + (i);
		saveAs(".tif", path );
		run("Maximum...", "radius=2");
		run("8-bit");
		run("Make Binary");
		run("Watershed");
		run("Analyze Particles...", "summarize");
		
		newpath= dir1 + File.nameWithoutExtension + " " + "Num" + (i);
		saveAs(".tif", newpath );
		close();
		selectWindow(files[i]);
		close();
		
		}
}

//End of counting.
showMessage("Message", "Please look at the items of 'Slice' and 'Count' in Summary");



// Fiji Copyright 2012 Schindelin, J.; Arganda-Carreras, I. & Frise, E. et al.
// Trainable Weka Segmentation Copyright 2017 Arganda-Carreras, I., Kaynig, V., Rueden, C., Eliceiri, K. W., Schindelin, J., Cardona, A., & Seung, H. S.
