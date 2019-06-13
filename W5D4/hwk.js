function madLib(verb, adj, noun) {
    return "We shall" + verb.toUpperCase() + "the" + adj.toUpperCase() + " " + noun.toUpperCase();
}

function isSubstring(searchString, subString) {
    let x = searchString.split(" ")
    
    for (var i = 0; i < x.length; i++) {
        if (x[i] === subString) {
            return true;
        } else {
            return false;
        }
    }
}

function fizzbuzz(array) {
    let x = [];
    for (var i = 0; i < array.length; i++) {
        if ((array[i] % 3 === 0 || array[i] % 5 === 0)) {
            x.push(array[i])
        }
        return x;
    }
}

// && !(array[i] % 3 === 0 && array[i] % 5 === 0))