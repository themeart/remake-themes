{extends file="../../Remake/layout/header.tpl"}

{block name='layout-header-breadcrumb'}
    {capture "breadcrumb_block"}
        {$smarty.block.parent}
    {/capture}
{/block}

{block name='layout-header-content-productlist-starttags' append}
    {$smarty.capture.breadcrumb_block}
{/block}