<?php

// database/factories/PostFactory.php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use Illuminate\Support\Str;
use Faker\Generator as Faker;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'uuid' => Str::uuid(),
            'user_id' => User::inRandomOrder()->first()->id,
            // 'user_id' => $this->faker->randomNumber(),
            'description' => $this->faker->paragraph,
            'view_count' => $this->faker->randomNumber(),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}


// database/factories/PostFactory.php

// use Faker\Generator as Faker;
// use Illuminate\Support\Str;
// use App\Models\Post;

// $factory->define(Post::class, function (Faker $faker) {
//     return [
//         'uuid' => Str::uuid(),
//         'user_id' => $faker->randomNumber(),
//         'description' => $faker->paragraph,
//         'view_count' => $faker->randomNumber(),
//         'created_at' => now(),
//         'updated_at' => now(),
//     ];
// });

