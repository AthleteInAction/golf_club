var ScorecardCtrl = ['$scope','API','$modal','round','teetime','current_user','$modalInstance','$http',
	function($scope,API,$modal,round,teetime,current_user,$modalInstance,$http){

		var scope = $scope;

		scope.API = API;

		scope.round = round;
		scope.current_user = current_user;
		scope.teetime = teetime;

		JP('SCORECARD');

		API.scores.get({teetime_id: teetime.id},function(data,error){

			if (!error){

				var tmp = [];
				angular.forEach([].times(round.scorecard.holes),function(val,key){

					hole = key+1;

					var score = API.scores.list.where('hole',hole);

					if (score){

						tmp.push(score);

					} else {

						tmp.push(API.scores.new({
							event_id: round.event_id,
							round_id: round.id,
							golfer_id: teetime.golfer_id,
							teetime_id: teetime.id,
							course_id: round.course.id,
							par: round.scorecard.pars[key],
							yards: round.scorecard.yards[key],
							handicap: round.scorecard.handicaps[key],
							hole: hole,
							score: null
						}));

					}

					scope.scores = tmp;

				});

			}	

		});

		scope.scores = [];

		scope.close = function(){

			$modalInstance.dismiss('cancel');

		};

		scope.addScores = function(a,b){

			var array = angular.copy(scope.scores).slice(a);
			if (b){array = angular.copy(scope.scores).slice(a,b);}

			var n = 0;

			angular.forEach(array,function(val,key){

				if (val && val.score){
					n += parseInt(val.score);
				}

			});

			return n;

		};

		scope.scoreType = function(par,score){

			if (!score){return '';}

			var diff = parseInt(score) - parseInt(par);

			if (diff == -1){return 'birdie';}
			if (diff < -1){return 'eagle';}
			if (diff == 1){return 'bogey';}
			if (diff > 1){return 'bad';}

			return '';

		};

		scope.toPar = function(scores){

			var n = 0;

			angular.forEach(scores,function(val,key){

				if (val && val.score){

					n += parseInt(val.score) - parseInt(round.scorecard.pars[key]);

				}

			});

			if (n == 0){n = 'E';}

			return n;

		};

	}
];