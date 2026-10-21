{extends file="../../Remake/basket/index.tpl"}

{block name='basket-index-price-tax'}
    {opcMountPoint id='opc_before_button_cart'}
{/block}
{block name='basket-index-shipping'}{/block}

{block name='basket-index-proceed-button' append}
    {opcMountPoint id='opc_after_button_cart'}
{/block}