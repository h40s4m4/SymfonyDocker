<?php

declare(strict_types = 1);

namespace App\MapperAndAPI\Mappers\Store;

use App\ApiResource\Store\StoreDTO;
use App\Entity\Store;
use Symfonycasts\MicroMapper\AsMapper;
use Symfonycasts\MicroMapper\MapperInterface;

#[AsMapper(from: Store::class, to: StoreDTO::class)]
final class StoreEntityToStoreDTOMapper implements MapperInterface
{
    public function load(object $from, string $toClass, array $context): object
    {
        $entity = $from;
        assert($entity instanceof Store);
        $dto = new StoreDTO();
        $dto->id = $entity->getId();

        return $dto;
    }

    public function populate(object $from, object $to, array $context): object
    {
        $entity = $from;
        $dto = $to;
        assert($entity instanceof Store);
        assert($dto instanceof StoreDTO);

        $dto->name = $entity->getName();

        return $dto;
    }
}