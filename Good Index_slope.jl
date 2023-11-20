# Import the plots directory by providing the location of that plots directory. This IO is type "Vector{String} (alias for Array{String, 1})" .
IO=readdir("/home/raman/runs_20231114/")
# Now in each string try to match for numbers after "beta-" and "betaerr" words.
for i in 1:length(IO)
	mat=match(r".+beta-(\d.\d+)_betaerr(\d.\d+)",IO[i])
	if mat==nothing 
		continue
	end
	ind=tryparse(Float64,mat.captures[1])
	err=tryparse(Float64,mat.captures[2])	
	print("$err\t")
# For strings having error value larger than index value , code need to jump to the next i value.
	if err>ind; continue; end
	if ind<=2.0
	mv("/home/raman/runs_20231114/$(IO[i])","/home/raman/GoodPlots/$(IO[i])",force=true)
	end
end
