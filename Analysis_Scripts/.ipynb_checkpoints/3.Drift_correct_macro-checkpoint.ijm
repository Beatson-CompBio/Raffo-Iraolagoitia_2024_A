// Batch Drift Correction of the stack images. 

// // Authors: Ryan Corbyn 
// // Date: 15/01/2024

// Select the directory containing the images to analyse.
dir = getDirectory("Select folder of images");
// Get all of the File names from the folder. 
list = getFileList(dir);

print(lengthOf(list))

// Create a save directory for the images. 
savedir = File.getParent(dir) + "/Drift_Correction/";
File.makeDirectory(savedir);

// Loop around all images in the folder. 
for (i=0; i<lengthOf(list); i++) {
	image_files = getFileList(dir + list[i]);
	
	save_prep = savedir + list[i];
	File.makeDirectory(save_prep);
	
	save_loc = save_prep + "Colour Channel/";
	File.makeDirectory(save_loc);
	
	for (j=0; j<lengthOf(image_files); j++) {
		// Use the bioformats to open up the .czi image file. 
		run("Bio-Formats Importer", "open=[" + dir + list[i] + image_files[j] + "] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYZCT");
		run("8-bit");
	}
	
	run("Merge Channels...", "c1=["+ list[i] +image_files[2] + "] c2=[" + list[i] +image_files[0] + "] c4=[" + list[i] +image_files[1] +  "] create");
	
	run("Correct 3D drift", "channel=3 correct sub_pixel only=0 lowest=1 highest=1 max_shift_x=25 max_shift_y=25 max_shift_z=10");
	
	run("Split Channels");
	
	saveAs("Tiff", save_loc + "C3_drift_corrected.tif");
	close();
	saveAs("Tiff", save_loc + "C2_drift_corrected.tif");
	close();
	saveAs("Tiff", save_loc + "C1_drift_corrected.tif");
	close();
	close();

}


//open("//data.beatson.gla.ac.uk/data/RCORBYN/User_Data/20240108_Ximena_cell_tracking/incucyte/XR175/XR175/Stack_images/G11/XR175_GreenUN_G11_1_2023y12m18d_16h50m_time_stack.tif");
//selectImage("XR175_GreenUN_G11_1_2023y12m18d_16h50m_time_stack.tif");
//open("//data.beatson.gla.ac.uk/data/RCORBYN/User_Data/20240108_Ximena_cell_tracking/incucyte/XR175/XR175/Stack_images/G11/XR175_phase_G11_1_2023y12m18d_16h50m_time_stack.tif");
//selectImage("XR175_phase_G11_1_2023y12m18d_16h50m_time_stack.tif");
//open("//data.beatson.gla.ac.uk/data/RCORBYN/User_Data/20240108_Ximena_cell_tracking/incucyte/XR175/XR175/Stack_images/G11/XR175_RedUN_G11_1_2023y12m18d_16h50m_time_stack.tif");
//selectImage("XR175_RedUN_G11_1_2023y12m18d_16h50m_time_stack.tif");
//selectImage("XR175_phase_G11_1_2023y12m18d_16h50m_time_stack.tif");
//selectImage("XR175_GreenUN_G11_1_2023y12m18d_16h50m_time_stack.tif");
//selectImage("XR175_phase_G11_1_2023y12m18d_16h50m_time_stack.tif");
//selectImage("XR175_RedUN_G11_1_2023y12m18d_16h50m_time_stack.tif");
//setOption("ScaleConversions", true);
//run("8-bit");
//selectImage("XR175_GreenUN_G11_1_2023y12m18d_16h50m_time_stack.tif");
//setOption("ScaleConversions", true);
//run("8-bit");
//selectImage("XR175_phase_G11_1_2023y12m18d_16h50m_time_stack.tif");
//run("Merge Channels...", "c1=XR175_RedUN_G11_1_2023y12m18d_16h50m_time_stack.tif c2=XR175_GreenUN_G11_1_2023y12m18d_16h50m_time_stack.tif c4=XR175_phase_G11_1_2023y12m18d_16h50m_time_stack.tif create");
//
//
//run("Properties...", "channels=3 slices=1 frames=50 pixel_width=1.0000 pixel_height=1.0000 voxel_depth=1.0000");
//
//
//
//run("Correct 3D drift", "channel=3 correct sub_pixel only=0 lowest=1 highest=1 max_shift_x=25 max_shift_y=25 max_shift_z=10");
//run("Split Channels");
//saveAs("Tiff", "//data.beatson.gla.ac.uk/data/RCORBYN/User_Data/20240108_Ximena_cell_tracking/incucyte/XR175/XR175/Drift_correction/_C3.tif");
//close();
//saveAs("Tiff", "//data.beatson.gla.ac.uk/data/RCORBYN/User_Data/20240108_Ximena_cell_tracking/incucyte/XR175/XR175/Drift_correction/_C2.tif");
//close();
//saveAs("Tiff", "//data.beatson.gla.ac.uk/data/RCORBYN/User_Data/20240108_Ximena_cell_tracking/incucyte/XR175/XR175/Drift_correction/_C1.tif");
//close();
