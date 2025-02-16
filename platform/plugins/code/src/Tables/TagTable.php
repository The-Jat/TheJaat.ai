<?php

namespace Botble\Code\Tables;

use Botble\Code\Models\CodeTag;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class TagTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(CodeTag::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('code_tags.create'))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('code_tags.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addActions([
                EditAction::make()->route('code_tags.edit'),
                DeleteAction::make()->route('code_tags.destroy'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('code_tags.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'created_at',
                        'status',
                    ]);
            });
    }
}
