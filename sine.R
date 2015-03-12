# generate sine wave of frequency f0, at sample rate fs
# with phase offset of phi, and amplitude of A
sine.generate <- function(f0, A, x, phi = 0) {
	wave = A*sin(2*pi*f0*x+phi)
	return(wave)
}

# Generate a vector of time of sample
# rate fs for seconds of time
time.generate <- function(fs, seconds=1) {
	u <- 1/fs
	v <- u*fs*seconds
	return(seq(0,v,u))
}

# Calculate angular frequency/speed of
# wave of frequency f0
sine.freqAngular <- function(f0) {
	return(2*pi*f0)
}

# Calculate instaneous phase of a wave of f0
# frequency, at time t with a phase of theta
sine.phaseInst <- function(f0, t, theta = 0) {
	return( sine.freqAngular(f0)*t+theta )
}

# Calculate instantaeous phase of wave of f0
# frequency at time t with phase theta 0
sine.freqInstAngular <- function(f0, t, theta = 0) {
	return( (sine.phaseInst(f0,t, theta)/(2*pi)) )
}