XPTemplate priority=personal
XPTvar $SParg   ''

XPT table
<div class="table" style="max-height: 30vh; overflow-y: auto;">
    <table>
        <thead>
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
</div>

XPT fieldset " <fieldset ..
<fieldset>
    <legend></legend>
    `cursor^
</fieldset>

XPT panel
<div class="panel-sm panel-default">
    <div class="panel-heading">`cursor^</div>
    <div class="panel-body">
    </div>
</div>

XPT row
<div class="row h-2-2">
    <div class="col-xs-5 text-right">`cursor^</div>
    <div class="col-xs-10">
    </div>
</div>

XPT rowe wrap=job
<div class="row">
    <div class="col-xs-5 text-right">`job^</div>
    <div class="col-xs-10">
        `cursor^
    </div>
</div>

XPT a-ng-click
<a href="javascript:void(0)" ng-click="`func^" title="`title^">`cursor^</a>

XPT a-ng-click wrap=job
<a href="javascript:void(0)" ng-click="`func^" title="`title^">`job^</a>

XPT a-href
<a href="`#^" target="_blank" title="`title^">`cursor^</a>

XPT a-href wrap=job
<a href="#" target="_blank" title="`title^">`job^</a>

XPT ng-modal
<modal-dialog show="vm.`dlg^" dialog-title="`title^" ng-modal-class="ng-modal-md" ng-cloak>
    <form name="vm.`dlg^Form" ng-submit="vm.`dlg^Submit()">
        <div class="panel-sm panel-default" style="max-height: calc(100vh - 10rem); overflow-y: auto;">

            <div class="panel-body" style="padding: 6px;">
            </div>

            <div class="panel-footer text-right">
                <button class="btn btn-primary" type="submit">`Save^</button>
                <button class="btn btn-default" ng-click="vm.`dlg^ = false" type="button">Close</button>
            </div>
        </div>
    </form>
</modal-dialog>

XPT ng-select-filter
<select
    class="form-control"
    ng-model="vm.filter.`model^"
    ng-options="el.name for el in vm.`model^List track by el.id">
    <option value=""></option>
</select>

XPT ng-select
<select
    class="form-control"
    ng-model="vm.`model^"
    ng-options="el.name for el in vm.`model^List track by el.id">
    <option value=""></option>
</select>


XPT ng-input
<input class="form-control" type="search" ng-model="`cursor^"/>

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

XPT ui-select-remote
<ui-select
    ng-model="`model^"
    append-to-body="true"
    theme="select2"
    style="width: 100%;">
    <ui-select-match allow-clear="true" placeholder="All">
        <span ng-bind="$select.selected.name"></span>
    </ui-select-match>
    <ui-select-choices
        repeat="el in `List^ track by el.id" 
        refresh="vm.`funct^($select.search)"
        refresh-delay="500"
        minimum-input-length="1">
        <span>{{el.name}}</span>
    </ui-select-choices>
</ui-select>

XPT ui-select-local
<ui-select
    ng-model="`model^"
    append-to-body="true"
    theme="select2"
    ng-required="true"
    style="width: 100%;">
    <ui-select-match allow-clear="true" placeholder="All">
        <span ng-bind="$select.selected.name"></span>
    </ui-select-match>
    <ui-select-choices repeat="el in ( `List^ | filter: $select.search ) | limitTo:50 track by el.id">
        <span>{{el.name}}</span>
    </ui-select-choices>
</ui-select>


XPT uib-dropdown
<div class="btn-group flex" uib-dropdown dropdown-append-to-body auto-close="outsideClick">
    <button id="split-button" type="button" class="btn btn-primary" uib-dropdown-toggle>`Actions^<span class="l-5"></span><span class="caret"></span></button>

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
<div
    uib-dropdown-multiselect
    selected-model="vm.`model^"
    options="vm.`^List"
    id="`model^"
    extra-settings="vm.extraSettings"
    ng-if="vm.extraSettings"
    events="{onSelectionChanged: vm.onSelectionChanged}" 
    class="uib-dropdown-multiselect uib-dropdown-multiselect-`model^"
    style="width: 100%;">
</div>

XPT autocomplte
<div angucomplete-alt
    style="width: 100%;"
    id="autocomplete-`id^"
    placeholder="Search `field^"
    pause="20"
    input-name="autocomplete-`id^"
    selected-object="vm.`selectedObject^"
    remote-url="./dataHelper.jsp?dtType=`dtType^&str="
    title-field="name"
    text-no-results="false"
    minlength="2"
    required="1"
    field-required="false"
    input-class="form-control form-control-small"
    match-class="highlight">
</div>

XPT collapsed
<div class="panel-default panel-sm">
    <div class="panel-heading flex-space-between">
        <div class="pointer" ng-click="vm.is`Collapsed^ = !vm.is`Collapsed^">
            <span class="r-5 lg-2">`title^</span>
            <span class="glyphicon glyphicon-chevron-right" ng-show="vm.is`Collapsed^"></span>
            <span class="glyphicon glyphicon-chevron-down" ng-show="!vm.is`Collapsed^"></span>
        </div>

        <div class="text-right">
            <span class="badge badge-primary">{{vm.`length^}}</span>
            <a class="l-15" href="javascript:void(0)" ng-click="vm.`addSomething^()">`action^/a>
        </div>
    </div>
    <div class="panel-body collapse" uib-collapse="vm.is`Collapsed^">
        `cursor^
    </div>
</div>

XPT ng-repeat-start
<div ng-repeat-start="xx in vm.`rootList^ track by $index">
    {{xx.group}}
</div>

<div ng-repeat="el in xx.children track by $index" ng-repeat-end>
    {{el.name}}
</div>

XPT qtip
<span ajax-qtip at="bottom rigth" rel="/pd/wicImg.jsp?WIC={{`el^.wic}}" art="`el^.wic" title="{{`el^.ec_descrition}}">
    <a href="javascript:void(0)" style="text-decoration: underline" ng-click="vm.showArticle(`el^.wic)">{{`el^.wic}}</a>
</span>

