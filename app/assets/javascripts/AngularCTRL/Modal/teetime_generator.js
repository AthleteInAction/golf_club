var TeetimeGeneratorCtrl = ['$scope','API','$modal','event','current_user','round','$modalInstance','teetimes',
	function($scope,API,$modal,event,current_user,round,$modalInstance,teetimes){

		var scope = $scope;

		scope.API = API;
		scope.event = event;
		scope.current_user = current_user;
		scope.round = round;

		JP('NEW ROUND');

		JP(round);

		var start_time = new Date(round.start_date);
		start_time.setHours(7);
		start_time.setMinutes(0);
		start_time.setSeconds(0);

		scope.generator = {
			start_time: start_time,
			round_id: scope.round.id,
			spacing: 10,
			per_group: 4,
			type: 'sequential'
		};

		scope.submit = function(){

			if (scope.teetime_form.$valid){

				JP('VALID');

				API.generate.teetimes(scope.generator,function(data,error){
					JP(error);
					JP(data);
					if (!error){
						teetimes.get({event_id: event.id,round_id: round.id});
						$modalInstance.dismiss('cancel');
					}
				});

			} else {

				JP('IN-VALID');

			}

		};

		scope.close = function(){

			$modalInstance.dismiss('cancel');

		};

	}
];