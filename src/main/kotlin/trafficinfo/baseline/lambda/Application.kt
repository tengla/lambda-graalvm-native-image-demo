package trafficinfo.baseline.lambda

import io.micronaut.runtime.Micronaut.*
fun main(args: Array<String>) {
	build()
	    .args(*args)
		.packages("trafficinfo.baseline.lambda")
		.start()
}

