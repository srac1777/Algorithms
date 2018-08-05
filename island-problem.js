// input = [[0,1,0,0,1],
        //  [0,1,0,1,1],
        //  [0,0,1,0,1]]

// output = [[0,1,0,0,1],
        //   [0,1,0,1,1],
        //   [0,0,0,0,1]]
Array.prototype.includes = function(el){
    for (let i = 0; i < this.length; i++) {
        const element = this[i];
        if (element[0] === el[0] && element[1] === el[1]) {
            return true;
        }
    }
    return false;
}

function islandConverter(grid){
    num_rows = grid.length;
    num_columns = grid[0].length;
    console.log("Input:\n");
    console.log(grid);
    
    
    // console.log(num_rows, num_columns);
    all_island_locations = island_locator(grid);
    // console.log(all_island_locations);

    for (let i = 1; i < grid.length-1; i++) {
        for (let j = 1; j < grid[0].length-1; j++) {
                if (grid[i][j] === 1) {
                    if(island_checker([i,j] , all_island_locations) === true){
                        all_island_locations.push([i,j]);
                    }
                }

                if (grid[i][(grid[0].length-1)-j] === 1) {
                    if (island_checker([i, (grid[0].length - 1) - j], all_island_locations) === true) {
                        all_island_locations.push([i, (grid[0].length - 1) - j]);
                    }
                }
        }
    }

    // console.log(all_island_locations);
    let result = [];
    for (let i = 0; i < all_island_locations.length; i++) {
        if (! result.includes(all_island_locations[i])) {
            result.push(all_island_locations[i]);
        }
        
    }

    // let result = Array.from(new Set(all_island_locations));
    // console.log( result );

    for (let i = 0; i < num_rows; i++) {
        for (let j = 0; j < num_columns; j++) {
            if (result.includes([i,j])) {
                grid[i][j] = 1;
            } else {
                grid[i][j] = 0;
            }
        }
    }
    console.log("\nOutput:\n");
    
    console.log(grid);
    
}

function island_locator(grid){
    let result = [];
    for (let i = 0; i < grid[0].length; i++) {
        if (grid[0][i] === 1) {
            result.push([0,i]);
        }
    }

    for (let i = 0; i < grid[0].length; i++) {
        if (grid[(grid.length-1)][i] === 1) {
            result.push([(grid.length-1), i]);
        }
    }

    for (let i = 1; i < grid.length-1; i++) {
        if(grid[i][0] === 1){
            result.push([i,0]);
        }
        if(grid[i][grid[0].length-1] === 1){
            result.push([i,grid[0].length-1]);
        }
    }
    return result;
}

function island_checker(location, all_island_locations){
    for (let i = 0; i < all_island_locations.length; i++) {
        const element = all_island_locations[i];

        if(element[0]+1 === location[0] && element[1] === location[1]){
            return true;
        }
        if (element[0] - 1 === location[0] && element[1] === location[1]) {
            return true;
        }
        if (element[0] === location[0] && element[1] + 1 === location[1]) {
            return true;
        }
        if (element[0] === location[0] && element[1] - 1 === location[1]) {
            return true;
        }
        
    }
    return false;
}

// islandConverter([[0, 1, 0, 0, 1], [0 , 1, 0, 1, 1], [0, 0, 1, 0, 1],[0,0,0,0,0]]);
islandConverter([[0,1,0,0,0,0,1], [0,1,0,0,1,1,1], [0,0,1,0,0,0,0],[0,0,0,0,0,0,0]]);

