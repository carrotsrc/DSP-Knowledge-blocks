# generate sine wave of frequency f0, at sample rate fs
# with phase offset of phi, and amplitude of A
sine.generate <- function(f0, A, x, phi = 0) {
	wave = A*sin(2*pi*f0*x+phi)
	return(wave)
}

generate.samples <- function(fs, seconds=1) {
	u <- 1/fs
	v <- u*fs*seconds
	return(seq(0,v,u))
}

sine.freqAngular <- function(f0) {
	return(2*pi*f0)
}

sine.phaseInst <- function(f0, t, theta = 0) {
	return( sine.freqAngular(f0)*t+theta )
}

sine.freqInstAngular <- function(f0, t, theta = 0) {
	return( (sine.phaseInst(f0,t, theta)/(2*pi)) )
}