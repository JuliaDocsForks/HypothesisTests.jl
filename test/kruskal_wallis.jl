using HypothesisTests, Base.Test

# www.uni-siegen.de/phil/sozialwissenschaften/soziologie/mitarbeiter/ludwig-mayerhofer/statistik/statistik_downloads/statistik_ii_7.pdf
u5 = [620, 5350, 7220]
u250 = [3580, 4180, 5690]
u2500 = [3600, 3820, 3840, 3850, 4160, 5300, 6900, 7120, 9370]
more = [3920, 4520, 4760, 8560, 10350]
t = HypothesisTests.KruskalWallisTest(u5, u250, u2500, more)

@test t.n_i == [length(u5), length(u250), length(u2500), length(more)]
@test t.df == 3
@test t.R_i == [31, 25, 88, 66]
@test_approx_eq t.H 1.5803174603174597
@test t.tie_adjustment == 1
@test_approx_eq pvalue(t) 0.6638608922384397
show(IOBuffer(), t)

# http://www.brightstat.com/index.php?option=com_content&task=view&id=41&Itemid=1&limit=1&limitstart=2
city1 = [68, 93, 123, 83, 108, 122]
city2 = [119, 116, 101, 103, 113, 84]
city3 = [70, 68, 54, 73, 81, 68]
city4 = [61, 54, 59, 67, 59, 70]
t = HypothesisTests.KruskalWallisTest(city1, city2, city3, city4)

@test t.n_i == [length(city1), length(city2), length(city3), length(city4)]
@test t.df == 3
@test t.R_i == [104, 113, 53, 30]
@test_approx_eq t.H 16.028783253379856
@test_approx_eq t.tie_adjustment 0.9969565217391304
@test_approx_eq pvalue(t) 0.0011186794961869423
println(t)
show(IOBuffer(), t)