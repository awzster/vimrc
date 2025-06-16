XPTemplate priority=personal
XPTvar $SParg   ''

XPT table
<table class="table">
    <thead class="k-simple-head">
        <tr>
            <th>#</th>
            `cursor^
        </tr>
    </thead>
    <tbody>
        <tr ng-repeat="el in vm.`job^ track by $index">
            <td class="text-right">{{el.pos}}</td>
        </tr>
    </tbody>
</table>

XPT fieldset " <fieldset ..
<fieldset>
    <legend></legend>
    `cursor^
</fieldset>

XPT handlebars
<div id="`dlg^-content"/>
<script id="`dlg^-src" type="text/template">
    `cursor^ 
</script>

XPT panel
<div class="panel-sm panel-default">
    <div class="panel-heading">`cursor^</div>
    <div class="panel-body">
    </div>
</div>

XPT row
<div class="row h-2-2">
    <div class="col-xs-6 text-right">`cursor^</div>
    <div class="col-xs-10">
    </div>
</div>

XPT row wrap=job
<div class="row">
    <div class="col-xs-6 text-right">`job^</div>
    <div class="col-xs-10">`cursor^</div>
</div>


XPT ng-modal
<modal-dialog show="vm.`show^" dialog-title="`title^" ng-modal-class="ng-modal-avg" ng-cloak>
    <div class="panel-sm panel-default" style="max-height: calc(100vh - 10rem); overflow-y: auto; margin: 4px;">

    <div class="panel-body" style="padding: 6px;">
    </div>

    <div class="panel-footer text-right">
        <button class="btn btn-primary" ng-click="vm.`action^()" type="button">`Save^</button>
        <button class="btn btn-default" ng-click="vm.`show^ = false" type="button">Close</button>
    </div>
</div>
</modal-dialog>

XPT ng-select
<select class="form-control" ng-model="`model^" ng-options="el.name for el in `cursor^List track by el.id"></select>

XPT ng-input
<input class="form-control" type="text" ng-model="`cursor^" style=""></input>

XPT button
<button class="btn btn-`default^" type="button" ng-click="vm.`action^()">`text here^</button>

XPT rinput wrap=job
<div class="row h-2-2">
    <div class="col-sm-4 text-right">`job^:</div>
    <div class="col-sm-8 text-left"><input class="form-control" type="input" ng-model="`cursor^"/></div>
</div>

XPT rselect wrap=job
<div class="row h-2-2">
    <div class="col-sm-4 text-right">`job^:</div>
    <div class="col-sm-8 text-left">
        <select class="form-control" ng-model="`model^" ng-options="el.name for el in `cursor^ track by el.id"></select>
    </div>
</div>

XPT ui-select
<ui-select ng-model="`cursor^" append-to-body="true" theme="select2" style="width: 100%;">
    <ui-select-match>
        <span ng-bind="$select.selected.name"></span>
    </ui-select-match>
    <ui-select-choices repeat="el in (`list^ | filter: $select.search) | limitTo:50 track by el.id">
        <span ng-bind="el.name"></span>
    </ui-select-choices>
</ui-select>

XPT multiselect
<ng-dropdown-multiselect options="vm.`cursor^List" selected-model="vm.filter.`cursor^" style="width: 20em;" list="width: 30em;"
    extra-settings="vm.extraSettings" ng-if="vm.extraSettings"></ng-dropdown-multiselect>
<!--
self.extraSettings = {displayProp: 'name', buttonClasses: 'btn btn-default ext-form-control', styleActive: true, 
    smartButtonMaxItems: 2, enableSearch: self.userList.length > 20? true: false};
-->

XPT uib-dropdown
<div class="btn-group flex" uib-dropdown dropdown-append-to-body auto-close="outsideClick">

    <button id="split-button" type="button" class="btn btn-primary">`Actions^</button>
    <button type="button" class="btn btn-primary" uib-dropdown-toggle>
        <span class="caret"></span>
        <span class="sr-only">Split button!</span>
    </button>

    <ul class="dropdown-menu dropdown-menu-right" uib-dropdown-menu role="menu" aria-labelledby="split-button">
        <li role="menuitem">
            <a href="javascript:void(0)" ng-click="vm.`action^()">`Action^</a>
        </li>
    </ul>
</div>


XPT sizes
<h3 class="visible-xs-block">XS</h3>
<h3 class="visible-sm-block">SM</h3>
<h3 class="visible-md-block">MD</h3>
<h3 class="visible-lg-block">LG</h3>

XPT ui.modal
<script type="text/ng-template" id="`myModalContent^.html">
  <div class="modal-header">
    <h3>`title^`</h3>
  </div>
  <form ng-submit="vm.submit()">
    <div class="modal-body">
    </div>
    <div class="modal-footer">
      <button type="submit" class="btn btn-primary" value="Submit" />
      <button type="button" class="btn btn-default" ng-click="cancel()">Cancel</button>
    </div>
  </form>
</script>

..XPT
" XPT sdiv alias=_t

" XPT diva " tips
" `:div( { 'content' : ':a:' } ):^

XPT multiselect
<div ng-dropdown-multiselect options="vm.`list^" selected-model="vm.filter.`model^" id="`model^"
    extra-settings="vm.extraSettings" ng-if="vm.extraSettings" style="width: 100%;"
    events="{onSelectionChanged: vm.onSelectionChanged}" ng-class="vm.filter.entity.`model^ == 0? 'error': ''">
</div>

XPT filter
<div class="panel-heading text-center">

    <div class="flex-space-between h-2-2">

        <div>

            <div class="btn-group flex" uib-dropdown auto-close="outsideClick" dropdown-append-to-body="true" is-open="vm.isMenuOpened">

                <button type="button" class="btn btn-primary" uib-dropdown-toggle>
                    <span class="glyphicon glyphicon-menu-hamburger"></span>
                    <span class="sr-only">Split button!</span>
                </button>

                <div class="dropdown-menu dropdown-menu-left dropdown-menu-filter" uib-dropdown-menu role="menu" 
                    aria-labelledby="split-button">

                    <div class="panel-sm panel-default">
                        <div class="panel-heading">
                            <div class="flex-space-between">
                                <div>Filter</div>
                                <div><span class='pointer lg-3' ng-click="vm.isMenuOpened = false">&times;</span></div>
                            </div>
                        </div>

                        <div class="panel-body">
                            <form name="vm.searchForm">
                                <div class="filter-container width">

                                    <div class="row h-2-2">
                                        <div class="col-xs-7 text-right">`title^:</div>
                                        <div class="l-5 col-xs-9 text-left">
                                            `content^
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>

                        <div class="panel-footer flex-space-between">
                            <div class="text-left">
                                <button class="btn btn-default" type="button" ng-click="vm.toFit()">To Fit</button>
                                <span class="l-5"></span>
                                <ls-save-state prefix="`prefix^" object-to-save="vm.objectToSave" default-object="vm.defaultObject"
                                    prepare-func="vm.prepareFunction()" 
                                    restore-func="vm.restoreFunction(obj)"
                                    last-used-view="{}"></ls-save-state>
                            </div>

                            <div class="text-right">
                                <button class="btn btn-primary" type="button" ng-click="vm.search()">Search</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div>
                <div class="l-15" style="white-space: nowrap;"> Total rows: <span class="sb">{{vm.gridData.length}}</span></div>
            </div>

            <div class="width flex" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                <div class="width text-left l-15" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                    <div class="flex">
                        <div ng-repeat="el in vm.filterString track by $index" style="max-width: 28em;" title="{{el.value}}" class="compact">
                            <span ng-class="$index == 0? 'l-5': 'l-15'">{{el.title}}:</span>
                            <span class="l-5 sb">{{el.value}}</span>
                            <span class="l-5" ng-hide="$last">|</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
