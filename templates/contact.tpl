{*{extends file='page.tpl'}

{block name='page_content'}
  {widget name="ps_contactinfo" hook='displayLeftColumn'}
{/block}*}

{extends file='page.tpl'}

{*{block name='page_header_container'}{/block}*}

{block name='left_column'}
    <div id="left-column" class="left-column">
        {widget name="ps_contactinfo" hook='displayLeftColumn'}
    </div>
{/block}

{block name='page_content'}
    {widget name="contactform"}
{/block}
