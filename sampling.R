
# Generate the min and max sample frequency
# for a given centre freq of fc, with a 
# bandwidth B and m replica spectrums
bandpass.fs <- function(fc, B, m) {
	x <- (2*fc-B)/m;
	y <- (2*fc+B)/(m+1);
	return(c(x,y));
}

# Calculate the nyquist criterion
# fs for a given center frequency of
# fc and a bandwidth B
bandpass.nyquistCriterion(fc, B) {
	return(2*(fc+(B/2)))
}
