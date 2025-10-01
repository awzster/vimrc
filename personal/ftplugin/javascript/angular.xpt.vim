XPTemplate priority=personal

XPT post
let params = utilsService.prepareParams(`param^);
Object.assign(params, { dtType: '`load^' });
return mainService.httpPost(params).then(() => {
    return this.`search^();
});

XPT get
return mainService.httpGet({ dtType: '`^' }).then(data => {
    `this = $.extend(this, data);^
});

XPT timeout wrap=job
$timeout(() => {
    `job^
});

XPT chain
let selected = this.gridOptions.api.getSelectedRows();
if (selected.length == 0)
    return swal('Error!', 'Select one or more lines!', 'error');

let chain = $q.when(true);
let lines = `selected^.map(el => el.line_id);
lines = _.chunk(lines, 50);
lines.map(el => {
    chain = chain.then(() => {
        return this.doUpdateSingle(el);
    });
});

return $q.when(chain).then(() => {
    this.search();
});


XPT watch
scope.$watch(function(scope) {return scope.`value^}, function(newVal, oldVal) {
    if (newVal)
        scope.`value^ = newVal;
    });

XPT angucomplete
<div angucomplete-alt
    id="`id^-autocomplete"
    placeholder="Search `pattern^"
    pause="100"
    selected-object="vm.`^selected"
    remote-url="./dataHelper.jsp?dtType=`Find^&&str="
    title-field="name"
    minlength="2"
    input-class="form-control form-control-small"
    match-class="highlight">
</div>

XPT ui.modal
var modalInstance = $uibModal.open({
  templateUrl: template || '`myModalContent^.html',
  controller: '`ModalInstanceCtrl^',
  controllerAs: 'vm',
  resolve: {
    items: function () {
      return this;
    }
  }
});

modalInstance.result.then(function (selectedItem) {
      $scope.selected = selectedItem;
    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });

.controller('`ModalInstanceCtrl^', function($scope, $uibModalInstance, modalFactory) {

  var self = this;
this.ok = function () {
    $modalInstance.close($scope.selected.item);
  };

  this.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
});

XPT $http.get
let deferred = $q.defer();
params.compCode = this.compCode;
return $http({method: 'get', cache: false, url: './dataHelper.jsp', params: params}).then(
    (data, status, headers, config) => { deferred.resolve(data.data) },
    (data, status, headers, config) => { deferred.reject(status) });
return deferred.promise;

XPT $http.post
let deferred = $q.defer();
params.compCode = this.compCode;
return $http({method: 'post', url: './dataHelper.jsp', data: $.param(params), 
    headers: { "Content-Type": "application/x-www-form-urlencoded" }}).then(
    (data, status, headers, config) => { deferred.resolve(data.data) },
    (data, status, headers, config) => { deferred.reject(status) });
return deferred.promise;

XPT ng-controller
angular.module('app').controller('`ctrl^`',
    [ '$scope', '$filter', '$timeout', '$q', 'dtIntervalService', 'mainService',
        function($scope, $filter, $timeout, $q, dtIntervalService, mainService)
        {
            let self = this;
            let vm = this;
            this.compCode = $('#compCode').val();
            this.pageId = $('#pageId').val();

            this.load = function()
            {
                `cusor^
            };

            this.load();
        }
    ]);


XPT Component
class `ComponentCtrl^ {

    constructor (errorService, $http, $q) {
        this.errorService = errorService;
        this.$http = $http;
        this.$q = $q;
    }

    httpGet(params)
    {
        var deferred = this.$q.defer();
        params = $.extend(params, {compCode: this.compCode});
        this.$http({ method: 'get', url: './dataHelper.jsp', params: params }).then(
            function success(response) {
                deferred.resolve(response.data);
            },
            function error(response) { this.errorService.processError(response, deferred); });
        return deferred.promise;
    };

    httpPost(params)
    {
        var deferred = this.$q.defer();
        params = $.extend(params, {compCode: this.compCode});
        this.$http({method: 'post', url: './dataHelper.jsp', data: $.param(params),
            headers: { "Content-Type": "application/x-www-form-urlencoded" }}).then(
                function success(response) { deferred.resolve(response.data); },
                function error(response) { this.errorService.processError(response, deferred); });
        return deferred.promise;
    };

    $onInit ()
    {
        this.httpGet({dtType: '`loadComponentData^'}).then((data) => {
            _.assign(this, data);
        });
    };

};

`ComponentCtrl^.$inject = ['errorService', '$http', '$q'];

const `MyComponent^ = {
    templateUrl: '`componentTemplate^.html',
    bindings: {
        search: '&'
    },
    //require: '^parentComponent',
    controller: `ComponentCtrl^,
    controllerAs: '$ctrl',
    transclude: true
};

//.component('`component^', `MyComponent^)



