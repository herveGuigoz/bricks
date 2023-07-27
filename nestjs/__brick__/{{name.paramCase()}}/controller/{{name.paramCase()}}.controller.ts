import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Logger,
} from '@nestjs/common';
import * as Swagger from '@nestjs/swagger';
import {
  {{name.pascalCase()}}Response,
  Create{{name.pascalCase()}}Request,
  Update{{name.pascalCase()}}Request,
} from '../dtos/{{name.paramCase()}}';
import {
  Create{{name.pascalCase()}}Usecase,
  Delete{{name.pascalCase()}}Usecase,
  FindAll{{name.pascalCase()}}Usecase,
  FindOne{{name.pascalCase()}}Usecase,
  Update{{name.pascalCase()}}Usecase,
} from '../usecases/{{name.paramCase()}}';

@Controller('{{name.paramCase()}}')
@Swagger.ApiTags('{{name.pascalCase()}}')
export class {{name.pascalCase()}}Controller {
  private readonly logger = new Logger({{name.pascalCase()}}Controller.name);

  constructor(
    private readonly create{{name.pascalCase()}}Usecase: Create{{name.pascalCase()}}Usecase,
    private readonly findAll{{name.pascalCase()}}Usecase: FindAll{{name.pascalCase()}}Usecase,
    private readonly findOne{{name.pascalCase()}}Usecase: FindOne{{name.pascalCase()}}Usecase,
    private readonly update{{name.pascalCase()}}Usecase: Update{{name.pascalCase()}}Usecase,
    private readonly delete{{name.pascalCase()}}Usecase: Delete{{name.pascalCase()}}Usecase,
  ) {}

  @Post()
  @Swagger.ApiOperation({ summary: 'Create a new {{name.pascalCase()}} ressource.' })
  @Swagger.ApiCreatedResponse({ type: {{name.pascalCase()}}Response })
  async create(@Body() body: Create{{name.pascalCase()}}Request) {
    const instance = await this.create{{name.pascalCase()}}Usecase.execute(body);

    return new {{name.pascalCase()}}Response(instance);
  }

  @Get()
  @Swagger.ApiOperation({ summary: 'Collection of {{name.pascalCase()}} ressource.' })
  @Swagger.ApiOkResponse({ type: {{name.pascalCase()}}Response, isArray: true })
  async findAll() {
    const instances = await this.findAll{{name.pascalCase()}}Usecase.execute();

    return instances.map((instance) => new {{name.pascalCase()}}Response(instance));
  }

  @Get(':id')
  @Swagger.ApiOperation({ summary: '{{name.pascalCase()}} ressource.' })
  @Swagger.ApiOkResponse({ type: {{name.pascalCase()}}Response })
  async findOne(@Param('id') id: string) {
    const instance = await this.findOne{{name.pascalCase()}}Usecase.execute(id);

    return new {{name.pascalCase()}}Response({ id, ...instance });
  }

  @Patch(':id')
  @Swagger.ApiOperation({ summary: 'Updates a {{name.pascalCase()}} ressource.' })
  @Swagger.ApiOkResponse()
  async update(
    @Param('id') id: string,
    @Body() request: Update{{name.pascalCase()}}Request,
  ) {
    await this.update{{name.pascalCase()}}Usecase.execute({ id, ...request });
  }

  @Delete(':id')
  @Swagger.ApiOperation({ summary: 'Deletes a {{name.pascalCase()}} ressource.' })
  @Swagger.ApiOkResponse()
  remove(@Param('id') id: string) {
    return this.delete{{name.pascalCase()}}Usecase.execute({ id });
  }
}
