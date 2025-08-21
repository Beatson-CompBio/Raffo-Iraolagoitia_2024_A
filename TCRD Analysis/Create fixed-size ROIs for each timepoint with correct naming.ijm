// Macro: Create fixed-size ROIs for each timepoint, with correct naming

fixedWidth = 85;
fixedHeight = 85;

roiManager("reset");

title = getTitle();
Stack.getDimensions(width, height, channels, slices, frames);
nT = frames;

for (t = 1; t <= nT; t++) {
    Stack.setFrame(t);

    // ---- CELL ROI ----
    makeOval(50, 50, fixedWidth, fixedHeight);
    waitForUser("Timepoint " + t + ": Move CELL ROI, then click OK");
    roiManager("Add");
    roiManager("select", roiManager("count") - 1); // Ensure only this ROI is selected
    roiManager("Rename", "cell_T" + d2s(t, 0) + "_" + title);

    // ---- BACKGROUND ROI ----
    makeRectangle(150, 150, fixedWidth, fixedHeight);
    waitForUser("Timepoint " + t + ": Move BACKGROUND ROI, then click OK");
    roiManager("Add");
    roiManager("select", roiManager("count") - 1); // Select again
    roiManager("Rename", "bg_T" + d2s(t, 0) + "_" + title);
}
