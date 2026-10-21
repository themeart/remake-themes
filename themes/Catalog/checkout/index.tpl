{extends file="../../Remake/checkout/index.tpl"}

{block name='checkout-index-content'}
    {container fluid=$Link->getIsFluid()}
        {alert variant="danger"}{lang key='pageNotFound' section='global'}{/alert}
    {/container}
{/block}