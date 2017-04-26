
{if $elements}
  <div id="block-reassurance" class="modules--blockreassurance">
    <ul>
      {foreach from=$elements item=element}
        <li><img class="icon" src="{$element.image}" alt="{$element.text|escape:'quotes'}" /> <span>{$element.text}</span></li>
      {/foreach}
    </ul>
  </div>
{/if}
