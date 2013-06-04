# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $modalGlobal = $('#modalGlobal')
  $checkboxOptionsTemplate = $('#form-object-options-templates #checkbox-options-template').clone()
  $checkboxTemplate =  $('#form-object-templates #checkbox-template').clone()
  $dropdownOptionsTemplate = $('#form-object-options-templates #select-options-template').clone()
  $dropdownTemplate = $('#form-object-templates #select-template').clone()
  $formPreview = $('#formPreview')

  idHash = { "_length": 0 }

  addFormObjId = (foid) ->
   idHash[foid] = "fo_" + idHash._length
   idHash._length += 1

  $('#formObjectsContainer').on 'change', '.formTypeSelect', (ev) ->
    $evTarget = $(this)
    formObjectId = $evTarget.prop 'id'
    $formObjectTypeOptions = $evTarget.parent().siblings '.formObjectTypeOptions'

    if $evTarget.val() == "1"
      $formObjectTypeOptions.html $checkboxOptionsTemplate.html()

      if idHash[formObjectId] != undefined && idHash[formObjectId] != null
        $formPreview.find('#' + idHash[formObjectId]).html $checkboxTemplate.children()
      else
        addFormObjId formObjectId
        $formPreview.find('.formDetails').html $checkboxTemplate.clone().prop 'id', idHash[formObjectId]

    else if $evTarget.val() == "2"
      $formObjectTypeOptions.html $dropdownOptionsTemplate.html()

      if idHash[formObjectId] != undefined && idHash[formObjectId] != null
        $formPreview.find('#' + idHash[formObjectId]).html $dropdownTemplate.children()
      else
        addFormObjId formObjectId
        $formPreview.find('.formDetails').html $dropdownTemplate.clone().prop 'id', idHash[formObjectId]

  .on 'keyup', '.cbAmt', (ev) ->
    $formDetails = $formPreview.children('.formDetails')
    $formDetailsCB = $formDetails.find('.checkbox')
    currentNumOfCB = $formDetailsCB.length
    numOfCB = parseInt($(this).val())

    # Too many checkboxes on the dom
    if numOfCB < currentNumOfCB
      while currentNumOfCB > numOfCB
        $formDetailsCB.eq(currentNumOfCB - 1).remove()
        currentNumOfCB -= 1
    # Checkboxes needed is more than what's on the dom
    else if numOfCB > currentNumOfCB
      while currentNumOfCB < numOfCB
        $formDetails.append $checkboxTemplate.html()
        currentNumOfCB += 1

  .on 'keyup', '.formObjectTypeTitle', (ev) ->
    $evTarget = $(this)
    $formPreview.find('.formObjectTitle').text($evTarget.val())

  .on 'click', '.cbLayoutOptions', (ev) ->
    $evTarget = $(this)
    $formDetails = $formPreview.children('.formDetails')
    $formDetailsCB = $formDetails.find('.checkbox')
    i = 0

    while i < $formDetailsCB.length
      if $evTarget.val() == "inline"
        $formDetailsCB.eq(i).addClass 'inline'
      else
        $formDetailsCB.eq(i).removeClass 'inline'
      i++

  .on 'click', '.allowMultipleSelection', (ev) ->
    $evTarget = $(this).find('input')
    $formDropdown = $evTarget.parents('.formProperties').siblings('.formPreview').find('select')

    if $evTarget.prop('checked') == true
      $formDropdown.prop('multiple', 'multiple')
    else
      $formDropdown.prop('multiple', '')

  .on 'keyup', '.dropdown-selections', (ev) ->
    $evTarget = $(this)
    selectionsArr = $evTarget.val().split('\n')
    selectionsHTML = []
    $formDropdown = $formPreview.find('select')
    i = 0

    while i < selectionsArr.length
      selectionsHTML.push('<option>' + selectionsArr[i] + '</option>')
      ++i

    $formDropdown.html selectionsHTML

  .on 'keyup', '#formTitle', (ev) ->
    $evTarget = $(this)
    $formPreview.find('#formPreviewTitle').text($evTarget.val())


  $('#preview-btn').on 'click', (ev) ->
    ev.preventDefault()
    $modalGlobal.find('.modal-header h2 .modal-title').text($('#form_title').val())
    $modalBody = $modalGlobal.find '.modal-body'
    $formPreviews = $('.formPreview').clone()
    formPreviewsLength = $formPreviews.length    
    i = 0

    while i < formPreviewsLength
      $modalBody.append($formPreviews.eq(i).html())
      ++i

    $modalGlobal.modal('toggle')
    .css({
      width: 'auto',
      'margin-left': ->
        return -($(this).width() / 2)
    })