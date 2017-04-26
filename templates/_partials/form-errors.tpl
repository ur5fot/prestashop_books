{block name='form_errors'}
  {if $errors|count}
    <ul class='templates--_partials--form-errors'>
      {foreach $errors as $error}
        <li>{$error}</li>
      {/foreach}
    </ul>
  {/if}
{/block}
