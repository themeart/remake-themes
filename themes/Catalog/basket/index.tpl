{extends file="../../Remake/basket/index.tpl"}

{block name='basket-index-content'}
    {container fluid=$Link->getIsFluid()}
        {alert variant="danger"}{lang key='pageNotFound' section='global'}{/alert}
    {/container}
{/block}