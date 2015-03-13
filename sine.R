# generate sine wave of frequency f0, at sample rate fs
# with phase offset of theta, and amplitude of A
sine.generate <- function(f0, A, x, theta = 0) {
	wave = A*sin(2*pi*f0*x+theta)
	return(wave)
}

# Generate a vector of time of sample
# rate fs for seconds of time
time.generate <- function(fs, seconds=1) {
	range <- fs-1
	u <- 1/fs
	v <- u*range*seconds
	return(seq(0,v,u))
}

# Calculate angular frequency/velocity of
# wave of frequency f0
sine.freqAngular <- function(f0) {
	return(2*pi*f0)
}

# Calculate instaneous phase of a wave of f0
# frequency, at time t with a phase of theta
sine.phaseInst <- function(f0, t, theta = 0) {
	return( sine.freqAngular(f0)*t+theta )
}

# Generate a chirp between frequency f0
# and f1, along the provided x values
sine.chirp <- function(f0, f1, x, theta = 0) {
	nfs = length(x);
	fdelta = f1-f0
	
	index = c(0:(nfs-1))

	y = sin( sine.freqAngular(x * (f0 +( fdelta) * (index/nfs) / 2)) + theta )
	return( y )
}

sine.waveChirp <- function(f0, f1, t, fs, x) {
	startSample <- (t*fs)-1
	end <- length(x)-1
	index  <- 0
	y <- vector()
	
	for(index in 0:startSample) {
		xv <- x[index]
		y <- c(y, sin( sine.phaseInst(f0,xv) ))
	}
	
	fdelta <- f1-f0;
	nfs <- length(x)-startSample+1
	pindex <- 0
	for(index in startSample:end) {
		y <- c(y, sin( sine.phaseInst((f0 + fdelta * (pindex/nfs) / 2 ), x[index])))
		pindex <- pindex+1;
		
	}
	
	return(y)
}
