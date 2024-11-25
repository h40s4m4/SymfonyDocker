<?php

declare(strict_types = 1);

namespace App\MapperAndAPI\Mappers\Store;

use App\ApiResource\Store\StoreDTO;
use App\Entity\Store;
use App\Repository\StoreRepository;
use Exception;
use Symfonycasts\MicroMapper\AsMapper;
use Symfonycasts\MicroMapper\MapperInterface;

#[AsMapper(from: StoreDTO::class, to: Store::class)]
final class StoreDTOToStoreEntityMapper implements MapperInterface
{

    public function __construct(private StoreRepository $storeRepository)
    {
    }

    public function load(object $from, string $toClass, array $context): object
    {
        assert($from instanceof StoreDTO);

        $userEntity = ($from->id) ? $this->storeRepository->find($from->id) : new Store();
        if (! $userEntity) {
            throw new Exception('Store not found');
        }

        return $userEntity;
    }

    public function populate(object $from, object $to, array $context): object
    {
        assert($from instanceof StoreDTO);
        assert($to instanceof Store);

        return $from->createStore($to);
    }
}