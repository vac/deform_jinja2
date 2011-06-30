# -*- coding: utf-8 -*-
<%
errstr = 'error-%s' % field.oid
%>
% if not field.widget.hidden:
<li
    % if field.error and field.widget.error_class:
    class="${field.widget.error_class}"
    % endif
    title="${field.description}"
    id="item-${field.oid}">
  <!-- mapping_item -->
  % if not (field.widget.hidden or field.widget.category=='structural'):
  <label class="desc"
         title="${field.description}"
         for="${field.oid}"
         >${field.title}
         % if field.required:
         <span class="req" id="req-${field.oid}">*</span>
         % endif
  </label>
  % endif

  ${field.serialize(cstruct)}

  % if field.error and not field.widget.hidden:
  % for index, msg in enumerate(field.error.messages()):
  <p id=${index==0 and errstr or ('%s-%s' % (errstr, index))}"
     class="${field.widget.error_class}">${msg}</p>
  % endfor
  % endif

  <!-- /mapping_item -->
</li>
% endif
