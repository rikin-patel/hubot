
module.exports = (robot) ->
	robot.hear /hi/i, (res) ->
		res.reply "GREETINGS!!!"	
