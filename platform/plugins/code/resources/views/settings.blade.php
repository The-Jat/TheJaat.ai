<x-core-setting::section
    :title="trans('plugins/code::base.settings.title')"
    :description="trans('plugins/code::base.settings.description')"
>
    <x-core-setting::checkbox
        name="code_post_schema_enabled"
        :label="trans('plugins/code::base.settings.enable_code_post_schema')"
        :value="setting('code_post_schema_enabled', true)"
        :helper-text="trans('plugins/code::base.settings.enable_code_post_schema_description')"
    />

    <x-core-setting::select
        name="code_post_schema_type"
        :label="trans('plugins/code::base.settings.schema_type')"
        :options="[
            'NewsArticle' => 'NewsArticle',
            'News' => 'News',
            'Article' => 'Article',
            'codePosting' => 'CodePosting'
        ]"
        :value="setting('code_post_schema_type', 'NewsArticle')"
    />
</x-core-setting::section>
