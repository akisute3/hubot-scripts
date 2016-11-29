# Description:
#   PPAP (Pen-Pineapple-Apple-Pen)
#
# Commands:
#   hubot ppap [very easy|easy|normal|hard|impossible] - Let's challenge PPAP!

module.exports = (robot) ->
  robot.respond /ppap(.*)/i, (res) ->
    difficulty = res.match[1].trim() || "normal"
    words =
      switch difficulty
        when "very easy"
          ["ﾍﾟﾝﾊﾟｲﾅｯﾎﾟｰ", "ｱｯﾎﾟｰﾍﾟﾝ"]
        when "easy"
          ["ﾍﾟﾝ", "ﾊﾟｲﾅｯﾎﾟｰ", "ｱｯﾎﾟｰ", "ﾍﾟﾝ"]
        when "normal"
          ["ﾍﾟﾝ", "ﾊﾟｲ", "ﾅｯﾎﾟｰ", "ｱｯﾎﾟｰ", "ﾍﾟﾝ"]
        when "hard"
          ["ﾍﾟﾝ", "ﾊﾟｲ", "ﾅｯ", "ﾎﾟｰ", "ｱｯ", "ﾎﾟｰ", "ﾍﾟﾝ"]
        when "impossible"
          ["ﾍﾟ", "ﾝ", "ﾊﾟ", "ｲ", "ﾅ", "ｯ", "ﾎﾟ", "ｰ", "ｱ", "ｯ", "ﾎﾟ", "ｰ", "ﾍﾟ", "ﾝ"]
        else
          false

    unless words
      res.reply("Undefined difficulty: #{difficulty}")
      return

    result = (words[Math.floor(Math.random() * words.length)] for [1..(words.length)])
    if result.join("") == "ﾍﾟﾝﾊﾟｲﾅｯﾎﾟｰｱｯﾎﾟｰﾍﾟﾝ"
      result.unshift(":tada::congratulations: ")
      result.push(" :congratulations::tada:")

    res.reply(result.join(""))
