{*modules/ps_linklist/views/templates/hook/linkblock.tpl*}
{foreach $linkBlocks as $linkBlock}
  {*<h3 class="h3">{$linkBlock.title}</h3>*}
  <ul class="modules--ps_linklist--linkblock">
    {foreach $linkBlock.links as $link}
      <li>
        <a
          id="{$link.id}-{$linkBlock.id}"
          class="{$link.class}"
          href="{$link.url}"
          title="{$link.description}"
        >
          {$link.title}
        </a>
      </li>
    {/foreach}
  </ul>
{/foreach}
