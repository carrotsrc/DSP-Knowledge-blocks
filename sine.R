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
	nfs <- length(x);
	fdelta <- f1-f0
	
	index <- c(0:(nfs-1))

	y = sin( sine.freqAngular(x * (f0 +(fdelta) * (index/nfs) * 0.5)) + theta )
	return( y )
}

# Generate a chirp starting at an arbitrary time
sine.delayChirp <- function(f0, f1, t1, t2, fs, x) {
	
	startSample <- (t1*fs)-1
	endSample <- (t2*fs)-1

	pi2 <- 2*pi;
	end <- length(x)
	index  <- 0
	
	y <- vector()
	
	for(index in 0:startSample) {
		y <- c(y, sin( sine.phaseInst(f0,x[index]) ))
	}
	
	
	sampleRange <- endSample-startSample	
	
	freqStep <- (f1-f0)/sampleRange
	step <- 0
	fn <- f0
	endSample <- endSample
	phase <- 0
	phaseOld <- sine.phaseInst(f0, x[index])
	
	for(index in startSample:endSample) {
		fn <- fn + freqStep
		if(index == startSample)
			print(fn)

		phaseDelta = (pi2*fn)/fs;
		phase <- phaseOld+phaseDelta %% pi2
		phaseOld <- phase
		y <- c(y, sin(phase))

	}
	
	print(fn)	
	endSample <- (endSample + 1)
	end <- end - 1
	phase <- phase + phaseDelta
	for(index in endSample:end) {
		xv <- x[index]
		y <- c(y, sin( sine.phaseInst(fn,xv, phase) ))
	}
	return(y)
}
