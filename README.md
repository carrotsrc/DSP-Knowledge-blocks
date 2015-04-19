This is a repository of different source files relevent to my neophyte study of DSP.

### Sine

`time.generate()`

Generate sample indecies at given Fs for period T

`sine.generate()`

Generate a sine wave of frequency F0

`sine.freqAngular()`

Calculate angular frequency for F0

`sine.phaseInst()`

Calculate instantaneous phase at sample x(t) at F0

`sine.chirp()`

Generate a (fake?) chirp between F0 and F1 over a given sample range x

`sine.delayChirp()`

Generate a wave of F0, Start generating a chirp between time t1 and t2 up to F1, continue wave F1

### Sampling

`bandpass.fs`

Calculate the minimum and maximum sample frequency for bandpass sampling, with a center frequency fc in a Bandwidth B with m spectral replications

`bandpass.nyquistCriterion`

Calculate the Nyquist criterion for bandpass sample centred on frequency fc with Bandwidth B
