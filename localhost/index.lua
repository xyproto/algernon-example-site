-- Function to read a file's content
local function readfile(filename)
    local file = io.open(filename, "r")
    if not file then return nil end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to read and render *.md files in the script directory
local function render_lyrics(file)
    local content = readfile(scriptdir(file))
    if content then
        mprint(content)
    else
        print('<p>Error: Unable to read markdown file</p>')
    end
end

-- Main function
local function main()
    print[[
    <!doctype html>
    <html>
    <head>
        <title>The Final Album</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>The Final Album</h1>
    ]]

    -- List of songs and corresponding markdown files for lyrics
    local songs = {
        {file = "song1.flac", lyrics = "song1.md", title = "Omf to the MAX"},
        {file = "song2.flac", lyrics = "song2.md", title = "Pling plong"}
        -- Add more songs as needed
    }

    -- Render each song and its lyrics
    for _, song in ipairs(songs) do
        print('<div class="song">')
        print('<h2>'..song.title..'</h2>')
        print('<audio controls>')
        print('<source src="'..song.file..'" type="audio/flac">')
        print('Your browser does not support the audio element.')
        print('</audio>')
        print('<p>Lyrics:</p>')
        render_lyrics(song.lyrics)
        print('</div>')
    end

    print[[
        </div>
    </body>
    </html>
    ]]
end

-- Execute main function
main()
