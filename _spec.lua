-- Import the Busted testing framework
local busted = require("busted")

-- Include the main Lua app file
local app = require("luaapp")

-- Create a test suite
describe("Lua App", function()
  -- Define a test case
  it("should print 'Hello, World!'", function()
    -- Redirect console output to capture it
    local oldPrint = print
    local output = ""
    print = function(...)
      output = output .. table.concat({...}, "\t") .. "\n"
    end

    -- Call the function to be tested
    app.helloWorld()

    -- Assert that the expected message is printed
    assert.are.equal("Hello, World!\n", output)

    -- Restore the original print function
    print = oldPrint
  end)
end)
