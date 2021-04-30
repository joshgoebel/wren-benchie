import "random" for Random
var RND = Random.new()

class Test {
    construct new(name, fn) {
        _name = name
        _fn = fn
        _max_len_name = 0
    }
    name { _name }
    fn { _fn }
}

class Strings {
    static pad(pad, s) {
        var extra = pad - s.count
        return "%(s)%(" " * extra)"
    }
}

class Math {
    static round(num, prec) {
        var place = 10.pow(prec)
        return (num*place).round/place
    }
}

class Benchmark {
    construct new(name) {
        _name = name
        _tests = []
        _max_len_name = 0
    } 
    name { _name }
    run() {
        System.print(name)
        System.print("-" * (_max_len_name + 25))
        _before.call()
        _tests.each { |test|
            var start = System.clock
            test.fn.call()
            var first = System.clock
            var diff = first - start
            var iterations = 1/diff
            for (i in (1..iterations)) {
                test.fn.call()
            }
            var stop = System.clock
            var total = stop - start
            var opsPerSec = (1/total)*iterations

            System.write(Strings.pad(_max_len_name+7,test.name))
            System.print("%(Math.round(opsPerSec,2)) ops/sec")
        }
    }
    before(fn) {
        _before = fn
    }
    add(name, fn) {
        _tests.add(Test.new(name,fn))
        if (name.count > _max_len_name) _max_len_name = name.count
    }
}