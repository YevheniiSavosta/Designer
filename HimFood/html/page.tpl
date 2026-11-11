<!-- Page template -->

{if $page->url == '404'}
    {include file='page_404.tpl'}

{elseif $page->url == 'publichna-oferta'}
	{include file='pages/Публічна оферта/Публічна оферта.tpl'}

{elseif $page->url == 'politika-konfidentsijnosti'}
	{include file='pages/Політика конфіденційності/Політика конфіденційності.tpl'}

{elseif $page->url == 'faq'}
	{include file='pages/FAQ/FAQ.tpl'}

<!---------------------------------------------------------------------->

{* Оплата та доставка *}
{elseif $page->url == 'oplata-ta-dostavka'}
	{include file='pages/Оплата та доставка/Оплата та доставка.tpl'}

{* Оплата та доставка - Оплата*}
{elseif $page->url == 'oplata'}
	{include file='pages/Оплата та доставка/Оплата/Оплата.tpl'}

{* Оплата та доставка - Доставка*}
{elseif $page->url == 'dostavka'}
	{include file='pages/Оплата та доставка/Доставка/Доставка.tpl'}

<!---------------------------------------------------------------------->

{elseif $page->url == 'socials'}
	{include file='pages/Соціальні мережі/Соціальні мережі.tpl'}

{elseif $page->url == 'obmin-ta-povernennya-tovaru'}
	{include file='pages/Обмін та повернення товару/Обмін та повернення товару.tpl'}

{elseif $page->url == 'pro-nas'}
	{include file='pages/Про нас/Про нас.tpl'}

{elseif $page->url == 'garantiya-ta-servisne-obslugovuvannya'}
	{include file='pages/Гарантія та сервісне обслуговування/Гарантія та сервісне обслуговування.tpl'}

{else}
    {* Стандартный шаблон для всех остальных страниц сайта *}
    <div class="block">
        {* The page heading *}
        <div class="block__header block__header--boxed block__header--border">
            <h1 class="block__heading">
                <span data-page="{$page->id}">{if $page->name_h1|escape}{$page->name_h1|escape}{else}{$page->name|escape}{/if}</span>
            </h1>
        </div>

        {* The page content *}
        <div class="block block--boxed block--border">
            <div class="block__description">{$description}</div>
        </div>
    </div>
{/if}