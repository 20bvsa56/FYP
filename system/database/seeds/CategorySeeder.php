<?php

use App\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        Category::create([
           'name'=>'Beverage',
            'slug'=>str_slug('beverage')
        ]);

        Category::create([
            'name'=>'Breakfast',
            'slug'=>str_slug('breakfast')
        ]);
    }
}
