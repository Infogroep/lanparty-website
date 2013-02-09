//tree bracket
//$(function() {
//	var container = $('#tree_brackets')
//	var saveData = $.parseJSON($('#compo_bracket_string').val())
//	
//	function saveFn(data, userData) {
//		var json = JSON.stringify(data) //jQuery.toJSON(data)
//		$('#compo_bracket_string').val(json)
//	}
//
//	container.bracket({
//		init: saveData,
//		save: saveFn,
//		userData: "http://myapi"})
//})
//
//list bracket

function render_list_brackets(container) {
	var saveData  = $.parseJSON($('#compo_bracket_string').val());
	var teams     = saveData.teams;
	var scores    = saveData.teams[0][1].length;
	var topCon    = $('<div class="jQBracket"></div>').appendTo(container);
	var bracket   = $('<div class="bracket" id="bracket">  </div>').appendTo(topCon);
	var tools     = $('<div class="tools"></div>').appendTo(topCon);
	var inc       = $('<div class="increment">+</div>').appendTo(tools)
	var dec       = $('<div class="decrement">-</div>').appendTo(tools)
	$(inc).click(addNewRound);
	$(dec).click(removeRound);
	teams = sort_teams(teams);
	for(var j = 0; j < scores; j++){
		var round = addRound(j, bracket);
		for(var i = 0; i<teams.length;i++){
			addTeam(i, teams[i], teams[i][1][j], round);
		}
	}
}

function array_sum(array){
	var total = 0;
	for(var i = 0; i<array.length; i++){
		total += array[i];
	}
	return total
}

function addNewRound(){
	var saveData  = $.parseJSON($('#compo_bracket_string').val());
	var bracket = $("#bracket");
	var teams= saveData.teams;
	var id = teams[0][1].length;
	teams = sort_teams(teams);
	var round = addRound(id, bracket);
	for(var i = 0; i<teams.length;i++){
		addTeam(i, teams[i], 0, round);
	}
	postProcess($('#list_bracket'));
}
function removeRound(){
	var saveData  = $.parseJSON($('#compo_bracket_string').val());
	var bracket = $("#bracket");
	var teams= saveData.teams;
	var id = teams[0][1].length-1;
	$(".round#round"+id).remove();
}

function addRound(id, container){
	var round = $('<div class="round", id="round'+id+'">Round '+(id+1)+'</div>').appendTo(container);
	return round;
}

function sort_teams(teams){
	function compare(x, y){
		return array_sum(x[1]) < array_sum(y[1]);
	}
	return teams.sort(compare);
}

function addTeam(id, team, score, container){
	t = $('<div class="team" id="'+id+'" index="0">'+
			'<b>'+team[0]+'</b>'+
			'<span class="result-'+id+'">'+score+'</span>'+
		'</div>').appendTo(container);
}

function postProcess(container){
	container.find('.team').hover(function(){
		$(this).toggleClass('highlight');
	});
	container.find('span').click(function(){
		changeToInput(this, container);
	});
}

function save(container){
	var target = $("#compo_bracket_string")
	var result_string = '{"teams":['
	var id=0;
	while(container.find('.team#'+id)[0]){
		team = container.find('.team#'+id);
		team_name = $(team[0].children[0]).text();
		scores = container.find('.result-'+id);
		score_array = [];
		for(var i=0; i<scores.length;i++){
			score_array.push($(scores[i]).text());
		}
		result_string += '["'+team_name+'", ['+score_array+']]';
		id++;
		if(container.find('.team#'+id)[0]){result_string+=', '}
	}
	result_string += ']}'
	target.val(result_string);
}

function changeToInput(element, container){
	var input = $('<input type="text">');
	var txt = $(element).text()
	input.blur(function(){
		var val = input.val();
		$(element).html(val);
		save(container);
		$(element).click(function(){changeToInput(element, container)});
	});
	input.val(txt)
	$(element).html(input);
	input.focus().select();
}


$(function(){
	var container = $('#list_bracket');
	render_list_brackets(container);
	postProcess(container);
})

