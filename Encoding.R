# Encoding.R
# There are 419 possible character set encodings available in
# R version 3.0.3 (2014-03-06) -- "Warm Puppy"
# Platform: x86_64-apple-darwin10.8.0 (64-bit)
#
# marek (http://stackoverflow.com/users/168747/marek) answered
# http://stackoverflow.com/questions/4806823/
#   how-to-detect-the-right-encoding-for-read-csv
# in part with the following code

codepages <- setNames(iconvlist(), iconvlist())
str(codepages)

# which is just a cute way of doing the simple
iconvlist()
