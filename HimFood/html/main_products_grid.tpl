{* Shared home-page grid. All products remain visible when JavaScript is disabled. *}
<div class="home-products fn_home_products" data-initial-rows="2" data-step-rows="2">
    <div id="home-products-{$grid_id|escape}" class="home-products__grid products_list" role="list">
        {foreach $grid_products as $product}
            <div class="home-products__item product_item no_hover" role="listitem">{include "product_list.tpl"}</div>
        {/foreach}
    </div>
    <div class="home-products__controls" hidden>
        <button class="home-products__more fn_home_products_more" type="button" aria-controls="home-products-{$grid_id|escape}">
            <span data-language="home_products_more">{$lang->home_products_more}</span>
            <svg width="18" height="18" viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/></svg>
        </button>
    </div>
    <span class="home-products__status fn_home_products_status" role="status" aria-live="polite" aria-atomic="true" data-added-label="{$lang->home_products_added|escape}"></span>
</div>
